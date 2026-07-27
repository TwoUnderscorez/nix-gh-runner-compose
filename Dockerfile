FROM nixos/nix
RUN nix-env --install --file '<nixpkgs>' --attr nix cacert -I nixpkgs=channel:nixpkgs-unstable
ARG gh_url gh_token gh_name attic_url attic_key attic_token attic_ep
RUN cat > /etc/nix/nix.conf << EOF
build-users-group = nixbld
experimental-features = nix-command flakes
sandbox = relaxed
substituters = $attic_ep https://cache.nixos.org
trusted-substituters = $attic_ep https://cache.nixos.org
trusted-public-keys = $attic_key cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
EOF
ENV NIXPKGS_REV='35d3407a3816f3b341d8cf1d60abaf2b7b8166ac'
RUN nix profile add nixpkgs/$NIXPKGS_REV#github-runner nixpkgs/$NIXPKGS_REV#attic-client nixpkgs/$NIXPKGS_REV#git-crypt
ENV RUNNER_ALLOW_RUNASROOT=1
RUN attic login attic-cache $attic_url $attic_token
RUN config.sh --unattended --url $gh_url --token $gh_token --name $gh_name --disableupdate --replace
CMD ["run.sh"]
