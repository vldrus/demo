# Just a Spring Boot base project

Example entity with [best practices](https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/) for Hibernate:

```java
@Entity
@Getter
@Setter
@ToString
public class Person {

    @Id
    @GeneratedValue
    private UUID id;

    private String name;

    // @OneToMany(mappedBy = "id", fetch = FetchType.LAZY)
    // @JsonIgnore
    // @ToString.Exclude
    // private Set<Email> emails;

    @Override
    public boolean equals(Object obj) {
        return (obj instanceof Person) && Objects.equals(getId(), ((Person) obj).getId());
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
```
