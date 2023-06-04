#!/usr/bin/env nu
def main [user: string] {
    let home_config = $"($env.PROJECT_ROOT)/users/($user)/home.nix";

    if ($home_config | path exists) == false {
        print $"($home_config) does not exists for user ($user)";
        exit 1;
    }

    home-manager switch -f $"($env.PROJECT_ROOT)/users/($user)/home.nix";
}
