//  PROGRAMMER: Roberto Arciniegas
//  PANTHERID: 1385020
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #1 Sample Program
//  DUE:            Thursday 09/03/15
//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Roberto Arciniegas on 9/2/15.
//  Copyright (c) 2015 Roberto Arciniegas. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic) int questionsCounter;
@property (nonatomic) int answersCounter;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;
@property (nonatomic, weak) IBOutlet UILabel *questionCounterLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerCounterLabel;
@end

@implementation BNRQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Create two arrays filled with questions and answers
        // and make the pointers point to them
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    
    // Return the address of the new object
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    // Step to the next question
    self.currentQuestionIndex++;
    self.questionsCounter++;
    // Am I past the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    // Get the string at that index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    // Display the string in the question label
    self.questionLabel.text = question;
    // Reset the answer label
    self.answerLabel.text = @"???";
    if (self.questionsCounter == 1)
        self.questionCounterLabel.text = [NSString stringWithFormat:@"Pressed %d time", self.questionsCounter];
    else
        self.questionCounterLabel.text = [NSString stringWithFormat:@"Pressed %d times", self.questionsCounter];
    
}

- (IBAction)showAnswer:(id)sender
{
    // What is the answer to the current question?
    self.answersCounter++;
    NSString *answer = self.answers[self.currentQuestionIndex];
    // Display it in the answer label
    self.answerLabel.text = answer;
    if ( self.answersCounter == 1 )
        self.answerCounterLabel.text = [NSString stringWithFormat:@"Pressed %d time",self.answersCounter];
    else
        self.answerCounterLabel.text = [NSString stringWithFormat:@"Pressed %d times",self.answersCounter];
    
}

@end
