{ lib, rustPlatform, fetchFromGitHub, installShellFiles, stdenv }:

rustPlatform.buildRustPackage rec {
  pname = "atuin";
  version = "18.15.2";

  src = fetchFromGitHub {
    owner = "atuinsh";
    repo = "atuin";
    rev = "v${version}";
    hash = "sha256-EzN42LMe21XqxlAwhAdk1bO4nsV2WumuBKjazHcoe+4=";
  };

  cargoHash = "sha256-QMLEbki3QhAxEd0Wuzfs7UN1O/MaEQ/ggxA6cFGDL6U=";

  buildNoDefaultFeatures = true;
  buildFeatures = [
    "ai"
    "client"
    "clipboard"
    "daemon"
    "hex"
    "sync"
  ];

  nativeBuildInputs = [ installShellFiles ];

  postInstall = lib.optionalString (stdenv.buildPlatform.canExecute stdenv.hostPlatform) ''
    installShellCompletion --cmd atuin \
      --bash <($out/bin/atuin gen-completions -s bash) \
      --fish <($out/bin/atuin gen-completions -s fish) \
      --zsh <($out/bin/atuin gen-completions -s zsh)
  '';

  checkFlags = [
    "--skip=registration"
    "--skip=sync"
    "--skip=change_password"
    "--skip=multi_user_test"
  ];

  preCheck = ''
    export HOME=$(mktemp -d)
  '';

  meta = with lib; {
    description = "Replacement for shell history with encrypted sync";
    homepage = "https://github.com/atuinsh/atuin";
    license = licenses.mit;
    mainProgram = "atuin";
  };
}
