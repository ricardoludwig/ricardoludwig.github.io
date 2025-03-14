---
layout: post
title:  "Singleton Pattern"
date:   2025-03-13 
categories: desing-patterns 
---

O padrão Singleton resolve dois problemas:

1. **Garante que classe que implementa esse padrão terá apenas uma instancia.**
Isso permite que o acesso ao um recurso que é compartilhado, por exemplo,
conexão com banco de dados ou dados de um arquivo carregado do sistema de 
arquivos.

2. **Disponibilizar um ponto de acesso global para a instância.** Isso 
quer dizer que a solução implementada com poderá ser aproveita pelo o restante 
da aplicação sem a necessidade de outras implementações. A ideia é semelhante
ao uso de variáveis globais, mas sem o efeito negativo de alteração de valores
ao longo do fluxo de execução, Singleton protege desse comportamento indesejável.

O uso desse padrão é aplicável nos casos onde é desejável que exista uma única
instância para todos os clientes ou quando precisa ter controle sobre variáveis
globais.

### Diagrama

![Singleton](../../../../assets/img/design-patterns/singleton-pattern.svg)

### Vantagens

* Há certeza que classe existirá apenas uma instância da classe.

* Ponto de acesso global para a instância.

* *Lazy Initialization*, o objeto é inicializado apenas quando é requisitado,
na primeira vez.

### Desvantagens

* O padrão poder mascarar um *design* ruim, por exemplo, quando componentes da
aplicação conhecem muito entre si.

* Se for inocentemente implementado pode acarretar em problemas de concorrência
em ambientes *multithread*.

* Pode ser difícil escrever teste unitários para esse tipo de implementação, por
conta de restrições dos **frameworks** de testes e **mocks**.

