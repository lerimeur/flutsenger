import { IsEmail,  IsNotEmpty } from 'class-validator';


export class AddMessageConvDto {
  @IsNotEmpty()
  conv_uuid: string;
  @IsNotEmpty()
  user_uuid: string;

  @IsNotEmpty()
  data: string;
}
