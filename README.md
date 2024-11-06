 # MetaverseLib

MetaverseLib is a Swift library designed as a solution to Crossmint coding challenge. 
 
## Installation

1. Clone this repository to your local machine.

```bash

git clone https://github.com/semujavier/MetaverseLib.git

```

2. Open the project in Xcode.

  ## Running
The package includes an executable target. To execute the code for the project you can write the following commands in the project directory:
```bash

swift build
swift run MetaverseExecutable

```

## Usage

To start using `MetaverseLib` in your project, you can use the `Metaverse` actor as follows:

```swift
import MetaverseLib
let metaverse = Metaverse.shared
Task {
    try await metaverse.buildMetaverse()
}

```

### Changing the `candidateId`

It uses a default candidate Id but you can dynamically change the `candidateId` using the `setCandidateId` method:

```swift

metaverse.setCandidateId("new-id")

```

## Customization Example for Testing

No unit test where developed but it is prepared to easy create them. You can inject your own implementations of `GoalFetcher` and `MetaverseProcessorProtocol`:

  

```swift

metaverse.setGoalRepository(MockGoalFetcher())

metaverse.setProcessor(MockMetaverseProcessor())

```

 
