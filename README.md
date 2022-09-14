# references-project-database
Database system to mantain references (books, articles and thesis) for a generic type of project.

Heres a simple preview of the tables and it's respective items, commented in Brazilian Portuguese:

1. Initial Page
  - INT id 'Identificador do item'
  - INT Number 'Numero da pagina inicial referenciada no documento'
2. Topic
  - INT id 'Identificador do item'
  - VARCHAR(64) Topic 'Nome/títutlo do item'
  - VARCHAR(128) Description'Descrição e detalhes sobre o tópico'
3. TitleOfResearcher
  - INT id 'Identificador do item'
  - VARCHAR(45) Title 'Título do pesquisador'
4. ProjectOfResearcher
  - INT id 'Identficador do item'
  - VARCHAR(64) Name 'Nome/Título do projeto de pesquisa'
5. Researcher
  - INT id 'Identificador do item'
  - TINYINT IsCommercialWorker 'Boolenado referente a ser um trabalhador empregado'
  - INT TitleOfResearcher_id 'Identificador do pesquisador'
  - INT ProjectOfResearcher_id 'Identificador do projeto de pesquisa'
6. Occupation
  - INT id 'Identificador do item'
  - VARCHAR(45) Name 'Nome da ocupação'
7. ComercialEmployee 
  - INT id 'Identificador do item'
  - INDEX INT Occupation_id 'Identificador da ocupação'
8. Schooling
  - INT id 'Identificador do item'
  - VARCHAR(45) Level 'Nome/título da escolaridade'
9. MaritalStatus
  - INT id 'Identificador do item'
  - VARCHAR(45) MaritalStatus 'Nome do estado civil'
10. Gender
  - INT id 'Identificador do item'
  - VARCHAR(45) Gender 'Nome do estado civil'
11. Country
  - INT id 'Identificador do item'
  - VARCHAR(45) Name 'Nome do país'
12. FUStateProvince
  - INT id 'Identificador do item'
  - VARCHAR(45) Name 'Nome do estado/província'
  - INT Country_id 'Identificador do país'
13. PhoneCode
  - INT id 'Identificador do item'
  - VARCHAR(5) Code 'Número do código de telefone'
14. City
  - INT id 'Identificador do item'
  - VARCHAR(45) Name 'Nome da cidade'
  - INT FUStateProvince_id 'Identificador do estado/província'
  - INT PhoneCode_id 'Identificador do codigo de telefone'
15. Author
  - INT id 'Identificador do item'
  - INT ComercialEmployee_id 
  - INT Researcher_id 'Identificador do pesquisador'
  - VARCHAR(45) NAME 'Nome do autor'
  - VARCHAR(11) CPF 'Cadastro de pessoa física (CPF)'
  - VARCHAR(45) RG 'Registro geral (RG)'
  - INT Schooling_id 'Identificador da escolaridade'
  - INT MaritalStatus_id' Identificador do estado civil'
  - INT Gender_id 'Identificador do genero'
  - INT Naturality_City_id 'Naturalidade do autor'
  - INT Nationality_Country_id 'Nacionalidade do autor'
16. WebAddress
  - INT id 'Identificador do item'
  - VARCHAR(45) URL 'Endereço Web, ou seja, a URL'
17. Institution
  - INT id 'Identificador do item'
  - VARCHAR(45) Name 'Nome/títutlo do item'
  - INT WebAddress_id 'Identificador do endereçoWeb'
18. Journal
  - INT id 'Identificador do item'
  - VARCHAR(128) Title 'Nome/títutlo do item'
  - VARCHAR(512) Abstract 'Resumo do conteúdo da revista d e até 512 caracteres'
  - DATE PublishDate 'Data de publicação da revista'
  - INT InitialPage_id` 'Identificador da página'
  - INT Topic_id 'Identificador do topico'
  - INT Author_id 'Identificador do autor'
  - INT Institution_id Identificador da instituição'
19. Keyword
  - INT id 'Identificador do item'
  - VARCHAR(64) Keyword 'Nome/títutlo do item'
20. PublishingCompany
  - INT id 'Identificador do item'
  - VARCHAR(45) Name 'Nome/títutlo do item'
  - INT WebAddress_id 'Identificador do endereçoWeb'
21. Email
  - INT id 'Identificador do item'
  - VARCHAR(45) email 'Email de máximo 45 caracteres'
  - INT PublishingCompany_id 'Identificador da editora'
  - INT Institution_id 'Identificador da instituição'
  - INT Author_id 'Identificador do autor'
22. AddressType
  - INT id 'Identificador do item'
  - VARCHAR(45) Decription 'Nome do tipo de endereço'
23. Neighborhood
  - INT id 'Identificador do item'
  - VARCHAR(45) Name 'Nome da rua/bairro'
  - INT City_id 'Identificador da cidade'
24. Address
  - INT id 'Identificador do item'
  - VARCHAR(45) Complement 'Complemento do endereço'
  - INT AddresType_id 'Identificador do endereço'
  - INT Neighborhood_id 'Identificador da rua/bairro'
25. Event
  - INT id 'Identificador do item'
  - VARCHAR(45) Name 'Nome/títutlo do item'
  - DATE Date 'Data em que ocorreu o evento'
  - INT Addres_id 'Identificador do endereço'
26. Section
  - INT id 'Identificador do item'
  - VARCHAR(45) Title 'Nome/títutlo do item'
  - INT Number 'Numero da seção referenciada'
27. PhoneType
  - INT id 'Identificador do item'
  - VARCHAR(45) Description 'Título do tipo de número'
28. PhoneNumber
  - INT id 'Identificador do item'
  - VARCHAR(9) Number 'Numero do telefone'
  - INT PhoneCode_id 'Identificador do codigo do telefone'
  - INT PhoneType_id 'Identificador do tipo de telefone'
  - INT Author_id 'Identificador do dono do telefone'
29. Article
  - INT id 'Identificador do item'
  - VARCHAR(128) Title 'Nome/títutlo do item'
  - VARCHAR(512) Abstract 'Resumo do artigo, contendo até 128 caracteres'
  - DATE PublishDate 'Data de publicação do artigo'
  - TINTYINT FromWeb 'Boolenado referente à obtenção do artigo pela internet'
  - INT WebAddress_id 'Endenreço da internet no qual o artigo foi obtido'
  - INT Topic_id 'Identificador do topico'
  - INT Author_id 'Identificador do autor'
  - INT Institurion_id 'Identificador da instituição'
  - INT Event_id 'Identificador do evento'
30. Book
  - INT id 'Identificador do item'
  - VARCHAR(128) Title 'Nome/títutlo do item'
  - VARCHAR(512) Abstract 'Resumo do conteúdo do livro de até 512 caracteres'
  - DATE PublishDate 'Data de publicação do livro'
  - INT InitialPage_id 'Identificador do item'
  - INT Topic_id 'Identificador do item'
  - INT Author_id 'Identificador do item'
  - INT Institution_id 'Identificador do item'
31. Thesis
  - INT id 'Identificador do item'
  - VARCHAR(128) Title 'Nome/títutlo do item'
  - VARCHAR(512) Abstract 'Resumo do conteúdo da dissertação/tése'
  - DATE PublishDate 'Data de publicação do documento'
  - INT Topic_id 'Identificador do item'
  - INT Author_id 'Identificador do autor'
  - INT Institution_id 'Identificador da instituição'
32. Edition
  - INT id 'Identificador do item'
  - VARCHAR(45) Number 'Número da edição do documento'
33. Thesis_Orienter
  - INT Thesis_id 'Identificador da tese'
  - INT Author_id 'Identificador do autor'
34. Journal_has_section
  - INT Journal_id 'Identificador da revista'
  - INT Section_id 'Identificador da seção'
35. AccessDate
  - INT id 'Identificador do item'
  - VARCHAR(45) AccessDate 'Data de acesso do artigo'
  - INT Article_id 'Identificador do artigo'
36. Book_has_Edition
  - INT Book_id 'Identificador do livro'
  - INT Edition_id 'Identificador da edição'
37. Thesis_has_Section
  - INT Thesis_id 'Identificador da tese'
  - INT Section_id'Identificador da seção'
38. Journal_has_Edition
  - INT Journa_id 'Identificador da revista'
  - INT Edition_id 'Identificador da edição'
39. Journal_has_Keyword
  - INT Journal_id 'Identificador da revista'
  - INT Keyword_id 'Identificador da palavra-chave'
40. Arcitle_has_keyword
  - INT Article_id 'Identificador do artigo'
  - INT Keyword_id 'Identificador da palavra-chave'
41. Book_has_Keyword
  - INT Book_id 'Identificador do livro'
  - INT Keyword_id 'Identificador da palavra-chave'
42. Thesis_has_keyword
  - INT Thesis_id 'Identificador da tese'
  - INT Keyword_id 'Identificador da palavra-chave'
43.Journal_has_PublishingCompany
  - INT Journal_id 'Identificador da revista'
  - INT PulishingCompany_id 'Identificador da editora'
44. Book_has_PublishingCompany
  - INT Book_id 'Identificador do livro'
  - INT PublishingCompany_id 'Identificador da editora'
45. Author_has_Address
  - INT Author_id 'Identificador do autor'
  - INT Address_id 'Identificador do endereço'
