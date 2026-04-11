FROM alpine:latest
# RUN apk add git curl xz coreutils bash
# ARG gh_url gh_token gh_name attic_url attic_token attic_ep
# ENV NIX_CONF_DIR=/etc/nix
# RUN mkdir -p /etc/nix && cat > /etc/nix/nix.conf << EOF
# build-users-group = nixbld
# sandbox = false
# experimental-features = nix-command flakes
# trusted-users = user
# allowed-users = user
# substituters = $attic_ep https://cache.nixos.org
# trusted-substituters = $attic_ep https://cache.nixos.org
# trusted-public-keys = $attic_key cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
# EOF
# RUN adduser -D user
# RUN mkdir -m 0755 /nix && chown user /nix
# USER user
# RUN sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon --yes
# RUN echo '. $HOME/.nix-profile/etc/profile.d/nix-daemon.sh' >> ~/.bashrc
# ENV RUNNER_ALLOW_RUNASROOT=1
# RUN . /home/user/.nix-profile/etc/profile.d/nix-daemon.sh && \
#     nix profile add nixpkgs#github-runner && \
#     nix profile add nixpkgs#attic-client && \
#     attic login attic-cache $attic_url $attic_token && \
#     config.sh --unattended --url $gh_url --token $gh_token --name $gh_name --disableupdate --replace
# ENTRYPOINT ["/bin/bash"]
# CMD ["run.sh"]
