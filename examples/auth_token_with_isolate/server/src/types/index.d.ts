type Author = {
  id: number;
  firstName: string;
  lastName: string;
  createdAt: string;
};

type Quote = {
  id: number;
  authorId: number;
  text: string;
  createdAt: string;
};

type OrderBy = {
  field: string;
  direction: string;
};

type JwtToken = {
  token: string;
};
