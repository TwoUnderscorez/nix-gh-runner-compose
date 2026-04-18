FROM nixos/nix
RUN nix-env -iA nixpkgs.github-runner
RUN nix-env -iA nixpkgs.attic-client
ARG gh_url gh_token gh_name attic_url attic_key attic_token attic_ep
RUN cat > /etc/nix/nix.conf << EOF
build-users-group = nixbld
experimental-features = nix-command flakes
trusted-users = user
allowed-users = user
sandbox = false
substituters = $attic_ep https://cache.nixos.org
trusted-substituters = $attic_ep https://cache.nixos.org
trusted-public-keys = $attic_key cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
EOF
ENV RUNNER_ALLOW_RUNASROOT=1
RUN attic login attic-cache $attic_url $attic_token
RUN config.sh --unattended --url $gh_url --token $gh_token --name $gh_name --disableupdate --replace
CMD ["run.sh"]

