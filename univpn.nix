{ pkgs ? import <nixpkgs> {} }:


pkgs.stdenv.mkDerivation rec {
  pname = "univpn";
  version = "1.0";

  src = /home/phil/Downloads/univpn-linux-64-10781.18.1.0512.run; # или скачайте через fetchurl

  buildInputs = [
    # Укажите нужные зависимости
    pkgs.coreutils
    pkgs.procps
  ];

  unpackPhase = '' true ''; # Отключаем распаковку, если файл самораспаковывается

  installPhase = ''
    mkdir -p "$out"/bin
    cp "${src}" "$out"/bin/univpn
    chmod +x "$out"/bin/univpn

    mkdir "$out"/tmp/
    mkdir "$out"/usr/
    mkdir "$out"/usr/local/
    mkdir "$out"/usr/local/UniVPN/
    mkdir "$out"/usr/local/UniVPN/serviceclient/
    touch "$out"/usr/local/UniVPN/serviceclient/UniVPNCS
    mkdir "$out"/usr/local/UniVPN/promote/
    touch "$out"/usr/local/UniVPN/log
    touch "$out"/usr/local/UniVPN/UniVPNUpdate
    touch "$out"/usr/local/UniVPN/promote/UniVPNPromoteService
    mkdir "$out"/usr/local/UniVPN/certificate/
    mkdir "$out"/usr/local/UniVPN/image/
    touch "$out"/usr/local/UniVPN/image/UniVPN.desktop

    chmod +x "$out"
    chmod +x "$out"/tmp/
    chmod +x "$out"/usr/
    chmod +x "$out"/usr/local/
    chmod +x "$out"/usr/local/UniVPN/
    chmod +x "$out"/usr/local/UniVPN/serviceclient/
    chmod +x "$out"/usr/local/UniVPN/serviceclient/UniVPNCS
    chmod +x "$out"/usr/local/UniVPN/promote/
    chmod +x "$out"/usr/local/UniVPN/log
    chmod +x "$out"/usr/local/UniVPN/UniVPNUpdate
    chmod +x "$out"/usr/local/UniVPN/promote/UniVPNPromoteService
    chmod +x "$out"/usr/local/UniVPN/certificate/
    chmod +x "$out"/usr/local/UniVPN/image/
    chmod +x "$out"/usr/local/UniVPN/image/UniVPN.desktop

    # Перенаправляем скрипт установки на новый каталог
    mkdir -p "$out"/local/UniVPN
    export INSTALL_PREFIX="$out"
    bash "$out"/bin/univpn --prefix="$INSTALL_PREFIX"

    # Копируем нужные файлы вручную, если необходимо
    find "$INSTALL_PREFIX" -type f | while read file; do
      if [[ -f "$file" ]]; then
        mkdir -p "$out"/$(dirname "$file")
        cp "$file" "$out"/$(dirname "$file")/
      fi
    done
  '';


  postFixup = ''
    wrapProgram "$out"/bin/univpn \
      --set PATH ${pkgs.lib.makeBinPath []}
  '';
  
  nativeBuildInputs = [ pkgs.makeWrapper ];

  meta = with pkgs.lib; {
    homepage = "";
    description = "Univpn Linux Client";
    license = licenses.free;
    platforms = platforms.linux;
  };
}
