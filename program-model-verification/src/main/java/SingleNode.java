public class SingleNode extends Cfg{
    public CfgNode node;

    public SingleNode(CfgNode node) {
        this.node = node;
    }

    @Override
    public CfgNode getStart() {
        return node;
    }

    @Override
    public void setNext(Cfg cfg) {
        node.addEdge(cfg.getStart());
    }
}
