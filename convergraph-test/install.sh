#!/bin/bash
# Sam Shepard - 2022.07

if [ ! -d "convergraph/" ]; then
    git clone https://github.com/sammysheep/convergraph.git \
        && cd convergraph \
        && git checkout v0.1 \
        || {
            echo "Failed to install convergraph. Are you in the same directory as $0?"
            exit 1
        }
else
    echo "Found 'convergraph'" \
        && cd convergraph
fi

cargo build --release \
    || {
        echo "
Did you install Rust? Go to: https://www.rust-lang.org/tools/install

Or execute:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        "
        exit 1
    }
