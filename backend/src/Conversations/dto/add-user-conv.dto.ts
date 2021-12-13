import { IsEmail,  IsNotEmpty } from 'class-validator';


export class AddUserConvDto {
  @IsNotEmpty()
  conv_uuid: string;
  @IsNotEmpty()
  user_username: string;
}
