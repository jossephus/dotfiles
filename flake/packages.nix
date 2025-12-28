{
  inputs,
  self,
  ...
}: {
  perSystem =
    {
      system,
      pkgs,
      ...
    }: {
      packages = import ../pkgs {inherit pkgs;};
    };
}
