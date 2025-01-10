{ ... }:

{
  homebrew = {
    enable = true;
    brews = [
      "poetry"
      "python@3.12"
      "swig"
    ];
    casks = [
      "microsoft-teams"
      "zotero"
      "whatsapp"
      "aldente"
      "anki"
    ];
  };
}
