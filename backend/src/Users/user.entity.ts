import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToMany, JoinTable,
} from 'typeorm';
import { Length } from 'class-validator';

import { ConvEntity } from '../Conversations/conv.entity';

@Entity()
export class UserEntity {
  @PrimaryGeneratedColumn("uuid")
  id: number;

  @Column({ unique: true })
  Username: string;

  @Column()
  @Length(5, 1024)
  password: string;

  @Column({ default: false })
  isVerified: boolean;

  @Column({ nullable: true })
  profilePictureURL: string;

  @ManyToMany(() => ConvEntity, conv => conv.users)
  @JoinTable()
  conv: ConvEntity[];
}
