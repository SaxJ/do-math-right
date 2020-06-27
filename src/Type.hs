module Type (
    Operand(..),
    Operator(..),
    Expression(..),
    Accuracy(..),
    Context(..),
    defaultContext,
) where

data Operator =
    Addition |
    Subtraction |
    Multiplication |
    Division |
    Power |

    LeftParentheses |
    RightParentheses |

    Decimal |
    Negation |

    Sine |
    Cosine |
    Tangent |

    Approximate

    deriving (Eq, Show)

type SimpleFraction = (Int, Int)

data Accuracy =
    Perfect |
    PlusOrMinus SimpleFraction
    deriving (Eq, Show)

type Fraction = (Int, Int, Accuracy)
type Variable = Char

data Expression =
    Fraction Fraction |
    Variable Variable |
    Expression ([Expression], Operator)
    deriving (Eq, Show)

type Operand = Expression

data Context = Context {
    approximate :: Bool
} deriving (Eq, Show)

defaultContext :: Context
defaultContext = Context {approximate = False}
