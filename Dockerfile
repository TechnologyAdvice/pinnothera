########################################
#        Base Build Environment        #
########################################

FROM rustlang/rust:nightly-bullseye AS rust-base

# Install build deps and cross toolchains
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        pkg-config \
        musl-tools \
    && apt-get install -yq gcc-aarch64-linux-gnu || apt-get install -yq gcc-x86-64-linux-gnu \
    && rm -rf /var/lib/apt/lists/*

RUN rustup default nightly

# Add all targets
RUN rustup target add \
        aarch64-unknown-linux-gnu \
        x86_64-unknown-linux-gnu \
        aarch64-unknown-linux-musl \
        x86_64-unknown-linux-musl

# Add components (rust-src + std for cross targets)
RUN rustup component add rust-src \
    && rustup component add \
        rust-std-aarch64-unknown-linux-gnu \
        rust-std-aarch64-unknown-linux-musl \
        rust-std-x86_64-unknown-linux-gnu \
        rust-std-x86_64-unknown-linux-musl

RUN cargo install cargo-chef


########################################
#          Cache Pre-Planner           #
########################################

FROM rust-base AS planner

WORKDIR /artifacts

COPY . /artifacts

# Create a "plan" for the dependency cache
RUN cargo chef prepare --recipe-path recipe.json


########################################
#           Artifact Factory           #
########################################

FROM planner AS artifactory

ARG cargo_profile=release

WORKDIR /artifacts

# Copy over the previously created dependency cache plan
COPY --from=planner /artifacts/recipe.json recipe.json

# Execute the plan and cache the project's dependencies
RUN cargo chef cook --recipe-path recipe.json --profile ${cargo_profile}

# Copy over the project's "actual" source ...
COPY . .

# ... and compile it
RUN cargo build --profile ${cargo_profile} \
    && mv "$(pwd)/target/${cargo_profile}/pinnothera" "$(pwd)/pinnothera-bin" \
    && chmod +x "$(pwd)/pinnothera-bin"


#####################################
#           Image Factory           #
#####################################

# Use distroless image for production
FROM gcr.io/distroless/cc AS pinn-image

COPY --from=artifactory /artifacts/pinnothera-bin /usr/bin/pinnothera

CMD ["/usr/bin/pinnothera"]


########################################
#         Precompiled Factory          #
########################################

FROM alpine:latest AS precompiled-artifactory

ARG profile='release'

ENV PINN_PROFILE=${profile}

WORKDIR /artifacts

# Copy over the precompiled binaries
COPY ./artifacts/ /artifacts/precompiled

RUN export TARGET_OS="$(uname -s | awk '{ print tolower($0) }')" \
    && export TARGET_ARCH="$(uname -m | sed 's#x86_64#amd64#g; s#aarch64#arm64#g')" \
    && mv "$(pwd)/precompiled/pinnothera-${TARGET_ARCH}-${TARGET_OS}-${PINN_PROFILE}" "$(pwd)/pinnothera-bin" \
    && rm -rf "$(pwd)/precompiled" \
    && chmod +x "$(pwd)/pinnothera-bin"



#####################################
#           Image Factory           #
#####################################

# Use distroless image for production
FROM gcr.io/distroless/cc AS precompiled-pinn-image

COPY --from=precompiled-artifactory /artifacts/pinnothera-bin /usr/bin/pinnothera

CMD ["/usr/bin/pinnothera"]
