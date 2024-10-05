{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnumake
    go
    golangci-lint
    gopls
    delve
    cmake
    gcc
    clang
    clang-tools
  ];
  home.sessionVariables = { EDITOR = "hx"; };
  programs.helix = {
    enable = true;
    settings = {
      theme = "onedark";
      keys.normal = {
        "{" = "goto_prev_paragraph";
        "}" = "goto_next_paragraph";
        "X" = "extend_line_above";
        "esc" = [ "collapse_selection" "keep_primary_selection" ];
        space.space = "file_picker_in_current_buffer_directory";
        space.w = ":w";
        space.q = ":bc";
        space.u = {
          f = ":format";
          w = ":set whitespace.render all";
          W = ":set whitespace.render none";
          h = ":set lsp.display-inlay-hints true";
          H = ":set lsp.display-inlay-hints false";
        };
      };
      keys.select = { "%" = "match_brackets"; };
      editor = {
        color-modes = true;
        cursorline = true;
        mouse = false;
        idle-timeout = 1;
        line-number = "relative";
        scrolloff = 5;
        completion-replace = true;
        true-color = true;
        rulers = [ 100 ];
        soft-wrap.enable = true;
        indent-guides = { render = true; };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
        gutters = [ "diagnostics" "line-numbers" "spacer" "diff" ];
        statusline = {
          left =
            [ "mode" "selections" "spinner" "file-name" "total-line-numbers" ];
          center = [ ];
          right = [
            "diagnostics"
            "file-encoding"
            "file-line-ending"
            "file-type"
            "position-percentage"
            "position"
          ];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };
      };
    };
  };
}
