import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var treeImageView: UIImageView!
    @IBOutlet private weak var correctWordLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private var letterButtons: [UIButton]!

    private var listOfWords = [
        "buccaneer",
        "swift",
        "glorious",
        "incandescent",
        "bug",
        "program"
    ]

    private let incorrectMovesAllowed = 7
    private var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    private var totalLosses = 0 {
        didSet {
            newRound()
        }
    }

    private var currentGame: Game!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Apple Pie"
        listOfWords.shuffle()
        newRound()
    }

    private func newRound() {
        guard !listOfWords.isEmpty else {
            correctWordLabel.text = "No words left!"
            scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
            treeImageView.image = UIImage(named: "Tree 0")
            enableLetterButtons(false)
            return
        }

        let newWord = listOfWords.removeFirst()
        currentGame = Game(
            word: newWord,
            incorrectMovesRemaining: incorrectMovesAllowed,
            guessedLetters: []
        )

        enableLetterButtons(true)
        updateUI()
    }

    private func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        treeImageView.contentMode = .scaleAspectFit
        treeImageView.accessibilityLabel = "Apple tree with \(currentGame.incorrectMovesRemaining) apples remaining"
    }

    @IBAction private func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false

        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)

        updateGameState()
    }

    private func updateGameState() {
        if currentGame.isLost {
            totalLosses += 1
        } else if currentGame.isWon {
            totalWins += 1
        } else {
            updateUI()
        }
    }

    private func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
}
