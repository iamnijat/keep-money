class GraphQlQueries {
  const GraphQlQueries._();

  static const transactionTypesQuery = """
query {
categories {
  id,
  title,
  type
}
}
""";

  static String transactionsQuery = """
query user(\$id: String){
  user(id: \$id) {
    id
    name
    gender
    income 
    transactions {
      id
      title
      type
      amount
      currency
      created_at
      userId
    }
  }
}
""";

  static String createUserQuery = """
mutation createUser(\$name: String, \$gender: String, \$income: String) {
createUser(name: \$name, gender: \$gender, income: \$income) {
id
name
gender
income
}
  }
""";

  static String updateUserQuery = """
mutation updateUser(\$id: String, \$name: String, \$gender: String, \$income: String) {
updateUser(id: \$id, name: \$name, gender: \$gender, income: \$income) {
id
}
  }
""";

  static String createTransactionQuery = """
mutation createTransaction(\$title: String, \$type: String, \$currency: String, \$created_at: String, \$userId: String, \$amount: String) {
createTransaction(title: \$title, type: \$type, currency: \$currency, created_at: \$created_at, userId: \$userId, amount: \$amount) {
title
type
currency
created_at
userId
amount
}
  }
""";

  static const removeTransactionQuery = """
mutation removeTransaction(\$id: String) {
removeTransaction(id: \$id) {
title
}
  }
""";
}
