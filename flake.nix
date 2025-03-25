{
  inputs = {
    garnix-lib.url = "github:garnix-io/garnix-lib";
    Haskell.url = "github:garnix-io/haskell-module";
  };

  nixConfig = {
    extra-substituters = [ "https://cache.garnix.io" ];
    extra-trusted-public-keys = [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
  };

  outputs = inputs: inputs.garnix-lib.lib.mkModules {
    modules = [
      inputs.Haskell.garnixModules.default
    ];

    config = { pkgs, ... }: {
      haskell = {
        haskell-project = {
          buildDependencies = [  ];
          devTools = [  ];
          ghcVersion = "9.6";
          runtimeDependencies = [  ];
          src = ./.;
          webServer = null;
        };
      };

      garnix.deployBranch = "master";
    };
  };
}
