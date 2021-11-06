import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  CreateDateColumn,
} from 'typeorm';
import {  Length } from 'class-validator';
import { v4 } from 'uuid';

@Entity()
export class MessageEntity {
  @PrimaryGeneratedColumn("uuid")
  id: number;

  @Column()
  data: string;

  @CreateDateColumn()
  createdDate: Date;

  @Column()
  @Length(1, 255)
  sender: string;
}

