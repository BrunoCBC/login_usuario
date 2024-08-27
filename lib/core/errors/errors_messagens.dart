abstract class MessagesError {
  // Erros gerais
  static const String defaultError = 'Erro Desconhecido!!!';

  // Erros relacionados a Pet
  static const String petNotFoundError = 'Erro: Pet não encontrado!!!';

  // Erros de validação
  static const String idError = 'Erro: ID não é positivo!!!';
  static const String nullStringError = 'Erro: String nula!!!';
  static const String emptyFieldError = 'Erro: Campo em branco!!!';
  static const String invalidDateError = 'Erro: Data inválida!!!';
  static const String minDoubleError = 'Erro: Valor menor que o permitido!!!';
  static const String maxDoubleError = 'Erro: Valor maior que o permitido!!!';
  static const String shorterStringError = 'Erro: String menor que o permitido!!!';
  static const String longerStringError = 'Erro: String maior que o permitido!!!';

  // Erros de usuário
  static const String userInvalidEmail = 'Erro: Email inválido!!!';
  static const String userDisabled = 'Erro: Login desabilitado!!!';
  static const String userNotFound = 'Erro: Login não encontrado!!!';
  static const String userWrongPassword = 'Erro: Senha não confere!!!';
  static const String emailAlreadyInUse = 'Erro: E-mail já em uso por outra conta!!!';
  static const String invalidEmail = 'Erro: E-mail não possui um formato válido!!!';
  static const String operationNotAllowed = 'Erro: Operação não permitida, contate o ADM!!!';
  static const String weakPassword = 'Erro: Senha muito fraca!!!';
  static const String passwordMismatch = 'Erro: Confirmação da senha não confere!!!';

  // Erros de cache
  static const String deleteSharedP = 'Erro ao excluir cache de login!!!';
  static const String saveSharedP = 'Erro ao salvar cache de login!!!';
  static const String saveSharedPKeyNotFound = 'Erro: Cache de login não encontrado!!!';
  static const String fetchSharedP = 'Erro ao recuperar cache de login!!!';
}