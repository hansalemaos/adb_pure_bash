#!/bin/bash
fu() {

    string=$(dumpsys input_method)
    substring="mInputShown=true"
    case "$string" in
    *"$substring"*)
        return 0
        ;;
    *)
        return 1
        ;;
    esac
}
fu
