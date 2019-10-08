package model;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
public class ToDoList {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String description;
    private LocalDate deadLine;
    private int priority;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
