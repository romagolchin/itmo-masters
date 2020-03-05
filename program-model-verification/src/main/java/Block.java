import java.util.List;

public class Block extends Cfg {
    public List<Cfg> nodes;

    public Block(List<Cfg> nodes) {
        this.nodes = nodes;
    }
    @Override
    public CfgNode getStart() {
        return nodes.get(0).getStart();
    }

    @Override
    public void setNext(Cfg cfg) {
        nodes.get(nodes.size() - 1).setNext(cfg);
    }
}
