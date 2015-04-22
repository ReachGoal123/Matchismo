//
//  TRViewController.m
//  Matchismo
//
//  Created by Tarena on 14-1-1.
//  Copyright (c) 2014年 Tarena. All rights reserved.
//

#import "TRViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface TRViewController ()

@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation TRViewController

- (CardMatchingGame *)game
{
    if (!_game)_game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:self.deck];
    return _game;
}

- (Deck *)deck
{
    if (!_deck) {_deck = [self createDeck];}
    return _deck;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        cardButton.tintColor = [self colorForCard:card];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

- (UIColor *)colorForCard:(Card *)card
{
    
    NSRange range1 = [card.contents rangeOfString:@"♥︎"];
    NSRange range2 = [card.contents rangeOfString:@"♦︎"];
    if (range1.location == NSNotFound && range2.location == NSNotFound) {
        return [UIColor blackColor];
    }
    return [UIColor redColor];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}
- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront":@"cardback"];
}



@end
