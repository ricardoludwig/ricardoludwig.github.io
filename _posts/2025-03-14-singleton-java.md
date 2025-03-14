---
layout: post
title:  "Singleton Pattern - Com Java"
date:   2025-03-14 
categories: desing-patterns 
---

Seguindo com o tema de *Design Patterns*, falando sobre o *Singleton Pattern*,
abaixo temos alguns exemplos utilizando Java.

## Solução Ingenua

Abaixo temos um exemplo de uma implementação ingenua de *Singleton*.

```java
public class SingletonNaive {

    private static SingletonNaive instance;
    private final String _data;

    private SingletonNaive(String value) {
        _data = value;
    }

    public static SingletonNaive getInstance(String value) {
        if (instance == null) {
            instance = new SingletonNaive(value);
        }
        return instance;
    }

    public String getData() {
        return _data;
    }
}
```

Em uma situação no qual esse código fosse executado em um ambiente *single 
thread* não haveria problema, a coisa complica quando é executado em um ambiente 
*multithread*, nessa situação não seria possível garantir a existência de uma 
única instância do objeto na aplicação.

### **Thread Safe**

#### Solução com *synchronized*

Uma forma de resolver essa problema seria adequar o código para ser *thread safe*,
para isso algumas alterações são necessárias, como o uso do *synchronized*,
porém ao adicionar synchronized na assinatura do método irá causar redução no
desempenho da solução, por causa do custo associado a sincronização, porém
esse comportamento é necessário apenas para as primeiras *threads*. Uma maneira
de evitar essa sobrecarga é usando o princípio de bloqueio de dupla verificação.
Nessa abordagem, o bloco sincronizado é usado dentro do *if* com uma verificação
adicional para garantir que apenas uma instância seja criada.

```java
public class SingletonSyncronized {

    private static volatile SingletonSyncronized instance;
    private final String _data;

    private SingletonSyncronized(String value) {
        _data = value;
    }

    public static SingletonSyncronized getInstance(String value) {
        if (instance == null) {
            synchronized (SingletonSyncronized.class) {
                if (instance == null) {
                    instance = new SingletonSyncronized(value);
                }
            }
        }
        return instance;
    }

    public String getData() {
        return _data;
    }
}
```
    
#### Solução com Static Holder Pattern 

Essa implementação faz uso de uma classe privada estática interna que mantém
a instância única da classe externa. Quando a classe externa é carregada a
classe interna não é carregada em memória enquanto não for executado o método
**getInstance()**. Essa é a abordagem elimina a necessidade da utilização de 
sincronização a melhor forma de implementação para Java.

```java
public final class SingletonHolder {
    private final String _data;

    private SingletonHolder() {
        _data = "Singleton data";
    }

    private static final class InstanceHolder {
        private static final SingletonHolder instance = new SingletonHolder();
    }

    public static SingletonHolder getInstance() {
        return InstanceHolder.instance;
    }

    public String getData() {
        return _data;
    }
}
```

