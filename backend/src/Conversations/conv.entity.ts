import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  CreateDateColumn, ManyToMany, JoinTable,
} from 'typeorm';
import { IsEmail, Length } from 'class-validator';
import { v4 } from 'uuid';
import { MessageEntity } from '../Messages/message.entity';
import { UserEntity } from '../Users/user.entity';

@Entity()
export class ConvEntity {
  @PrimaryGeneratedColumn("uuid")
  id: number;

  @ManyToMany(() => MessageEntity)
  @JoinTable()
  messages: MessageEntity[];

  @ManyToMany(() => UserEntity, user => user.conv)
  users: UserEntity[];

  @Column()
  @Length(1, 255)
  title: string;
}
