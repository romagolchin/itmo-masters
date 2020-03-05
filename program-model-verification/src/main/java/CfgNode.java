import java.util.ArrayList;
import java.util.List;

public class CfgNode {
    public List<String> labels;
    public List<CfgEdge> outEdges;
    public List<CfgEdge> inEdges;

    public CfgNode(List<String> labels, List<CfgEdge> outEdges, List<CfgEdge> inEdges) {
        this.labels = labels;
        this.outEdges = outEdges;
        this.inEdges = inEdges;
    }

    public CfgNode(List<String> labels) {
        this(labels, new ArrayList<>(), new ArrayList<>());
    }

    public void addEdge(CfgNode otherNode) {
        addEdge(otherNode, null);
    }

    public void addEdge(CfgNode otherNode, String label) {
        outEdges.add(new CfgEdge(label, otherNode));
        otherNode.inEdges.add(new CfgEdge(label, this));
    }
}
