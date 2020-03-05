public class While extends Cfg {
    public CfgNode condition;
    public Cfg body;

    @Override
    public CfgNode getStart() {
        return condition;
    }

    @Override
    public void setNext(Cfg cfg) {
        condition.addEdge(cfg.getStart());
    }
}
