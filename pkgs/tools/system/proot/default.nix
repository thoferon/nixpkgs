{ stdenv, fetchFromGitHub, fetchpatch
, talloc, docutils }:

({ version, rev, sha256, patches }: stdenv.mkDerivation {
  name = "proot-${version}";
  inherit version;

  src = fetchFromGitHub {
    inherit rev sha256;
    repo = "proot";
    owner = "proot-me";
  };

  buildInputs = [ talloc ];
  nativeBuildInputs = [ docutils ];

  enableParallelBuilding = true;

  inherit patches;

  makeFlags = [ "-C src" ];

  postBuild = ''
    make -C doc proot/man.1
  '';

  installFlags = [ "PREFIX=$(out)" ];

  postInstall = ''
    install -Dm644 doc/proot/man.1 $out/share/man/man1/proot.1
  '';

  meta = with stdenv.lib; {
    homepage = http://proot-me.github.io;
    description = "User-space implementation of chroot, mount --bind and binfmt_misc";
    platforms = platforms.linux;
    license = licenses.gpl2;
    maintainers = with maintainers; [ ianwookim makefu veprbl ];
  };
})
(if stdenv.isAarch64 then rec {
  version = "5.1.0";
  sha256 = "0azsqis99gxldmbcg43girch85ysg4hwzf0h1b44bmapnsm89fbz";
  rev = "v${version}";
  patches = [
    (fetchpatch { # debian patch for aarch64 build
      sha256 = "18milpzjkbfy5ab789ia3m4pyjyr9mfzbw6kbjhkj4vx9jc39svv";
      url = "https://sources.debian.net/data/main/p/proot/5.1.0-1.2/debian/patches/arm64.patch";
    })
  ];
} else {
  version = "5.1.0.20190305";
  sha256 = "0qink34bjv0lshf3c8997w39r8yxgbhxpjbxw47l5xkvimlpc0dl";
  rev = "ff61c86cb26f71c06af22574d9d4cc3a77292781";
  patches = [];
})
