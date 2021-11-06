import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import * as bcrypt from 'bcrypt';
import { Repository } from 'typeorm';

import { MessageEntity } from './message.entity';
// import { CreateConvDto } from './dto/creat';
import { UserEntity } from '../Users/user.entity';
import { CreateUserDto } from '../Users/dto/create-user.dto';
import { AddMessageConvDto } from './dto/add-message';

@Injectable()
export class MessageService {
  constructor(
    @InjectRepository(MessageEntity)
    private readonly messageRepository: Repository<MessageEntity>,
  ) {}

  async create(dto: AddMessageConvDto): Promise<MessageEntity> {
    const message = new MessageEntity();

    message.sender = dto.user_uuid;
    message.data = dto.data;


    return this.messageRepository.save(message);
  }

  // async findAll(): Promise<MessageEntity[]> {
  //   return await this.messageRepository.find({relations: ['users', 'messages']});
  // }
  //
  // async addUser(conv: MessageEntity, user: UserEntity): Promise<MessageEntity> {
  //   if (conv.users)
  //     conv.users.push(user);
  //   // conv.users.push(user);
  //   return this.messageRepository.save(conv);
  // }
  //
  // async findByEmail(email: string): Promise<MessageEntity> {
  //   return this.messageRepository.findOne({ where: { email } });
  // }
  //
  // findOne(id: string): Promise<MessageEntity> {
  //   return this.messageRepository.findOne(id, {relations: ['users', 'messages']});
  // }

  async remove(id: string): Promise<void> {
    await this.messageRepository.delete(id);
  }
}
