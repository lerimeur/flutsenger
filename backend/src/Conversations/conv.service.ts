import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import * as bcrypt from 'bcrypt';
import { Repository } from 'typeorm';

import { ConvEntity } from './conv.entity';
import { CreateConvDto } from './dto/create-conv.dto';
import { UserEntity } from '../Users/user.entity';
import { MessageEntity } from '../Messages/message.entity';

@Injectable()
export class ConvService {
  constructor(
    @InjectRepository(ConvEntity)
    private readonly convRepository: Repository<ConvEntity>,
  ) {}

  async create(dto: CreateConvDto, user: UserEntity): Promise<ConvEntity> {
    const conv = new ConvEntity();

    conv.title = dto.title;
    conv.users = [user];
    conv.messages = [];

    return this.convRepository.save(conv);
  }

  async findAll(): Promise<ConvEntity[]> {
    return await this.convRepository.find({relations: ['users', 'messages']});
  }

  async addMessage(conv, message: MessageEntity): Promise<ConvEntity> {
    conv.messages.push(message);
    return this.convRepository.save(conv);
  }

  async addUser(conv: ConvEntity, user: UserEntity): Promise<ConvEntity> {
    if (conv.users)
      conv.users.push(user);
    // conv.users.push(user);
    return this.convRepository.save(conv);
  }

  async findByEmail(email: string): Promise<ConvEntity> {
    return this.convRepository.findOne({ where: { email } });
  }

  findOne(id: string): Promise<ConvEntity> {
    return this.convRepository.findOne(id, {relations: ['users', 'messages']});
  }

  async remove(id: string): Promise<void> {
    await this.convRepository.delete(id);
  }
}
