//
//  ViewController.h
//  TalkingApp
//
//  Created by Abacomm
//  Read more: www.abacomm.com.br/blog
//

// Declaração dos frameworks que queremos utilizar
#import "ViewController.h"
@import AVFoundation;

// Declaração dos componentes visuais
@interface ViewController ()
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *talkButton;
@end

@implementation ViewController


#pragma mark - Lifecycle

// View foi carregada
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Criando o TextField onde será digitado o texto que será falado
    self.textField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField.font = [UIFont boldSystemFontOfSize:15.0f];
    self.textField.textColor = [UIColor redColor];
    self.textField.placeholder = @"Digite seu texto aqui";
    [self.view addSubview:self.textField];
    
    // Criando o botão que irá iniciar a fala
    self.talkButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.talkButton setTitle:@"Falar" forState:UIControlStateNormal];
    [self.talkButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.talkButton addTarget:self action:@selector(talkButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.talkButton];
}

// View irá aparecer
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Definindo o tamanho e posição do TextField na tela
    self.textField.frame = CGRectMake(10, 30, self.view.frame.size.width - 20, 40);
    
    // Definindo o tamanho e posição do botão
    self.talkButton.frame = CGRectMake(10, 120, self.view.frame.size.width - 20, 45);
}


#pragma mark - Button Actions

// Esse método é chamado no momento que o botão é pressionado, conforme linha 42.
- (void)talkButtonTapped {
    [self talkWithUserSayingString:self.textField.text];
}


#pragma mark - Talking Methods

- (void)talkWithUserSayingString:(NSString *)string {
    // Cria uma instância do AVSpeechUtterance com a string recebida
    // Essa instância vai guardar informações como texto, voz e velocidade
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:string];
    
    // Define que o idioma será Português do Brasil
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    
    // Define a velocidade da fala (mínimo 0.5 e máximo 2)
    utterance.pitchMultiplier = 1.2f;
    
    // Cria uma instância do AVSpeechSynthesizer
    // Essa instância vai reproduzir o som conforme definições feitas na AVSpeechUtterance
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    [synthesizer speakUtterance:utterance];
}


@end
