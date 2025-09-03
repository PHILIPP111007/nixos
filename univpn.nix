{ pkgs ? import <nixpkgs> {} }:

{
  pkgs.stdenv.mkDerivation = {
    pname = "univpn";
    version = "1.0";
    
    src = /home/phil/Downloads/univpn-linux-64-10781.18.1.0512.run; # или скачайте через fetchurl

    buildInputs = [
      # укажите зависимости которые нужны программе
    ];

    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/univpn
      chmod +x $out/bin/univpn
      
      # Если программа устанавливает файлы в разные места
      bash /home/phil/Downloads/univpn-linux-64-10781.18.1.0512.run --prefix=$out
    '';

    postFixup = ''
      wrapProgram $out/bin/my-program \
        --set PATH ${pkgs.stdenv.lib.makeBinPath [ 
          # необходимые бинарные утилиты
        ]}
    '';
  };
}
