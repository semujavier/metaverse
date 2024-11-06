#! /usr/bin/swift
import MetaverseLib

print("Starting Metaverse build...")

Task {
    try? await Metaverse.shared.buildMetaverse()
    print("Finished building Metaverse.")
}

import Foundation
RunLoop.main.run()
