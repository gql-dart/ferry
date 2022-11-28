import jwt from "jsonwebtoken";

export default class AuthRepository implements AuthenticationRepository {
  public async login(
    input: AuthenticationRepository.LoginParameters
  ): Promise<JwtToken> {
    return {
      token: jwt.sign({ uid: input.username }, process.env.JWT_SECRET, {
        expiresIn: "7d",
        algorithm: "HS256",
      }),
    };
  }
}
