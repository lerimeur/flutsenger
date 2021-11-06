import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  CreateDateColumn, ManyToMany, JoinTable,
} from 'typeorm';
import { IsEmail, Length } from 'class-validator';
import { v4 } from 'uuid';
import { ConvEntity } from '../Conversations/conv.entity';

@Entity()
export class UserEntity {
  @PrimaryGeneratedColumn("uuid")
  id: number;

  @Column({ nullable: true })
  @Length(2, 255)
  firstName: string;

  @Column({ nullable: true })
  @Length(6, 255)
  lastName: string;

  @Column({ nullable: true })
  age: number;

  @Column()
  @Length(5, 1024)
  password: string;

  @Column()
  @IsEmail()
  @Length(6, 255)
  email: string;

  @Column({ default: false })
  isVerified: boolean;

  @Column({ nullable: true })
  profilePictureURL: string;

  @Column({ nullable: true, default: v4() })
  verification: string;

  @ManyToMany(() => ConvEntity, conv => conv.users)
  @JoinTable()
  conv: ConvEntity[];
}
