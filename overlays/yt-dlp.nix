final: prev: {
  yt-dlp = prev.yt-dlp.overridePythonAttrs (old: {
    dependencies =
      if prev.stdenv.hostPlatform.isDarwin
      then
        builtins.filter (
          dep: (dep.pname or dep.name or "") != "curl-cffi"
        ) (old.dependencies or [])
      else old.dependencies or [];
  });
}
