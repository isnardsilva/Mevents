#  Mevents

Aplicativo que exibe uma lista de eventos e permite fazer check-in nos eventos desejados, bem como, compartilhá-los.


## Requisitos
- Xcode 12+
- Cocoa Pods


## Funcionalidades
- [x] Consumir uma API REST
- [x] Exibir a listagem de eventos
- [ ] Exibir os detalhes de cada evento
- [ ] Realizar o check-in em cima de um evento
- [ ] Realizar o compartilhamento de um evento
- [ ] Salvar informações dos usuário (nome e e-mail) para que ele não precise inserí-las toda vez que for fazer o check-in
- [ ] Salvar o id dos eventos que já foi feito check-in (para exibí-los na hora da listagem)


## Tecnologias
- Swift
- MVVM
- Coordinator
- View Code
- Cocoa Pods
- Swift Lint
- Kingfisher
- URLSession
- UIKit
- User Defaults


## Cronograma
- [x] Criar o repositório no GitHub
- [x] Adicionar .gitignore e README
- [x] Adicionar o Xcode project
- [x] Adicionar o Swift Lint via Cocoa Pods
- [x] Implementar o Coordinator Pattern
- [x] Implementar a camada de Network
- [x] Testar a camada de Network
- [x] Implementar a obtenção dos eventos da API (Event Service)
- [x] Testar a classe Event Service
- [x] Implementar a tela de listagem de eventos
- [ ] Implementar a tela que exibe os detalhes dos eventos
- [ ] Implementar o ato de fazer check-in
- [ ] Testar o ato de fazer check-in
- [ ] Salvar os eventos que já foram realizados check-ins
- [ ] Salvar o nome e o e-mail do usuário para facilitar o processo de check-in
- [ ] Testar o salvamento das informações do usuário
- [ ] Implementar o sistema de compartilhamento
- [ ] Colocar um ícone do app
- [ ] Executar o app em diferentes devices
