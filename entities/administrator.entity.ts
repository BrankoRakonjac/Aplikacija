import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class Administrator {
    @PrimaryGeneratedColumn({ name: 'administrator_id' , type: 'int', unsigned: true })
    administratorId: number;
    
    
    @Column({ type: 'varchar', lenght: '32', unique: true})
    username: string;


    @Column({ name: 'password_hash' ,type: 'varchar' , lenght: '128'})
    passwordHash: string;
}
