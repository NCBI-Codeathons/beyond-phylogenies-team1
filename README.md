
## Explorations in linking evolution + function via visualization (and: data prep/analysis)

Phylogenies consist of many and different type information hitherto represented as trees. Thus, exploration the visual space of non-tree-based representations of phylogenetic information might divulge important missing details.


## Project Goals

* Tying phylogenies to function
    - What are the positively/negatively selected regions and could that be visualized on the tree?
    - Is there evidence of convergent evolution within a specific mutation / set of mutations?
    - Visualization methods that combine evolutionary tree-like info with physical (say antigenic characteristics).
    - Visualize clade growth rates on top of a protein structure
    - Faster evolving regions → positive selections?
    - Can we link chemical-level information to trees?  Can we represent how sequences are evolving over time?
    - Deliverables: prototype of visualization to compare to a tree
* Are there plausible epidemiological links between cases?
    - How many clusters are there?  Are they all part of the same transmission chain?
    - Which cases share a 	common source?
* Geographical origin of clades.
    - How have transmission chains been connected?
    - Previous VOCs have all followed a pretty predictable pattern: emergence in Europe is followed by emergence and proliferation across the U.S. typically starting in the East Coast (NYC esp.) and spreading westward. Can we visualize this relationship?  Are there deviations?


## Approach

* Understand transitions in the species of amino acid but utilize a multiple measures approach: nucleotide or hamming, temporal
    - Track amino acid species and mutations
    - Single linkage or a fast parsimonious algorithm
    - Graph not tree for viz
    - Prioritize seeds using strain count from disparate lineages
* Fast and portable reference-based dimensionality reduction of large data sets
    - Find seed reference for disparate groups to use for reference coordinates
    - Take desired distance function(s) from said references
    - Create PCA (non-distance matrix method) from vectors (or try alternative approach link another MDS + NN)
    - Now test how data distribute when re-using the rotation matrix
    - OR: Maybe phylogenetic place without placement at all
        - Analyze the patristic distances to reference seeds instead of based on primary data, but starting with a small guide tree
    - computationally efficient methods for large datasets (dim reduction like UMAP/MDS/t-SNE) 
* Implementation of classifier generative adversarial network without priors for simulation purposes

## Presentation

Take a look at https://docs.google.com/presentation/d/1ddCmTW5JrTk-lBqCy6K72f52acDkJZjbpSEwj7ukiiQ/edit?usp=sharing

# Team

List of participants and affiliations:
- Laura Hughes, Scripps Research (Team Leader)
- Samuel Shepard, CDC
- Sreyya Sudharsan, MD Anderson Cancer Centre
- Eric Chirtel, CDC
- Praneeth Gangavarapu, Scripps Research
- Hayden Brochu, LabCorp
- Vasileios Alevizos, iKnowHow
