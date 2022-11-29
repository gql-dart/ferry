export default (nodes: any[], after: number) => {
  return nodes.map((node, index: number) => ({
    cursor: Buffer.from(`cursor${index + after + 1}`).toString("base64"),
    node,
  }));
};
