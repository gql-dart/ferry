export default (
  edges: any[],
  totalCount: number,
  hasNextPage: boolean,
  hasPreviousPage: boolean
) => {
  return {
    edges,
    pageInfo: {
      endCursor: edges.length === 0 ? null : edges[edges.length - 1].cursor,
      hasNextPage,
      hasPreviousPage,
      startCursor: edges.length === 0 ? null : edges[0].cursor,
    },
    totalCount,
  };
};
