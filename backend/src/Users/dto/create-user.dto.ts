import {  IsNotEmpty } from 'class-validator';


export class CreateUserDto {
  @IsNotEmpty()
  Username: string;

  @IsNotEmpty()
  password: string;
}
