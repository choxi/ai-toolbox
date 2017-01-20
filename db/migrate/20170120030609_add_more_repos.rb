class AddMoreRepos < ActiveRecord::Migration[5.0]
  def change
    repos = [
      "cerndb/dist-keras",
      "maxpumperla/elephas",
      "apache/spark",
      "scikit-learn/scikit-learn",
      "torch/torch7",
      "pytorch/pytorch",
      "pfnet/chainer",
      "tflearn/tflearn",
      "facebookresearch/fastText",
      "explosion/spaCy",
      "tomlepaine/fast-wavenet",
      "jcjohnson/fast-neural-style",
      "alexjc/neural-enhance",
      "theano/theano",
      "openai/gym",
      "openai/universe",
      "openai/pixel-cnn",
      "numpy/numpy",
      "pandas-dev/pandas",
      "BVLC/caffe",
      "dmlc/mxnet",
      "karpathy/convnetjs",
      "Lasagne/Lasagne",
      "deeplearning4j/deeplearning4j",
      "cazala/synaptic",
      "NervanaSystems/neon"
    ]

    repos.each do |full_name|
      begin
        user, name = full_name.split("/")

        repo = Repo.create!({
          user: user,
          name: name
        })

        repo.update_stats
      rescue => e
        puts e
      end
    end
  end
end
