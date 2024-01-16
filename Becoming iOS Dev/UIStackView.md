# What is UIStackView?

Instead of having to create or give constraints to your UIComponents,
you'd only be giving fewer constraints to a single StackView.

Conceptually, stackView is simple as it is merely a container that holds the UIComponents similar to how it was layed out previously.
One big difference is that you'd have to add the components into the stackView(constainer) using addArrangedSubView.

Afterwards, you have the choice on how to distribute the components inside the stackView. The distributions are defined in 4 different ways.

### Distribution
- Fill
- Fill Equally
- Equal Spacing
- Equal Centering

### Alignment
- Top
- Bottom
- Center
- Fill

### Additional Information to Notice
1. StackView is a CONTAINER PERIOD.
Yet, they do not have an intrinsic content size of its own.
Therefore, the size of the UIStackView changes dynamically according to the components inside and how the components are constrained.
2. Every Content inside UIStackView needs an intrinsic content size.