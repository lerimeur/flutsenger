import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import * as bcrypt from 'bcrypt';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { UserEntity } from './user.entity';
import { ConvEntity } from '../Conversations/conv.entity';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(UserEntity)
    private readonly usersRepository: Repository<UserEntity>,
  ) {}

  async create(dto: CreateUserDto): Promise<UserEntity> {
    const user = new UserEntity();

    user.password = await bcrypt.hash(
      dto.password || Math.random().toString(36).substr(2, 8),
      10,
    );

    user.Username = dto.Username;
    return this.usersRepository.save(user);
  }

  async findAll(): Promise<UserEntity[]> {
    return await this.usersRepository.find({relations: ['conv']});
  }

  async findByEmail(email: string): Promise<UserEntity> {
    return this.usersRepository.findOne({ where: { email } });
  }

  findOne(id: string): Promise<UserEntity> {
    return this.usersRepository.findOne(id,  {relations: ['conv']});
  }

  findOneByUserName(Username: string): Promise<UserEntity | undefined> {
    return this.usersRepository.findOne({Username}, {relations: ['conv']});
  }

  async remove(id: string): Promise<void> {
    await this.usersRepository.delete(id);
  }

  async update(user: UserEntity, conv: ConvEntity): Promise<void> {
    console.log(user);
    const tmp = await this.usersRepository.findOne(user.id);


    await this.usersRepository.update(user.id, tmp);
  }

  async getconv(id: string): Promise<ConvEntity[]> {
    const data: UserEntity = await this.usersRepository.findOne(id, {relations: ['conv']});
    if (data == undefined) {
      console.log('ERROR');
      return [];
    }
    console.log(data);
    return data.conv;
  }
}
