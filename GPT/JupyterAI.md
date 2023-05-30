[Jupyter AI — Jupyter AI documentation](https://jupyter-ai.readthedocs.io/en/latest/index.html)

## The %%ai magic command

https://jupyter-ai.readthedocs.io/en/latest/users/index.html#the-ai-magic-command


### prepare

```
pip install jupyter_ai_magics
%load_ext jupyter_ai_magics
pip install openai
%env OPENAI_API_KEY=sk...
```

### prompt

```
poet = "Walt Whitman"
%%ai chatgpt
Write a poem in the style of {poet}
```

### output

```
Ode to the Open Road
Oh, the open road, how vast and grand, Stretching out before us, across the land! In the sun or rain, we journey forth, With nothing to hinder our endless girth.

The wind in our hair, the world our stage, Our feet pounding pavement, with a rhythmic rage. The sights and sounds of life all around, In every step, a new adventure found.

From the mountains high, to the valleys deep, To the rushing rivers and oceans steep, Our hearts beat wild with each new sight, As we journey forth, towards infinite light.

Oh, the open road, how it calls to us, To wander and seek, without any fuss. For every mile, a story to tell, Of triumph and loss, and love as well.

So let us embrace this journey true, With all its twists and turns to pursue. For on this open road, our souls can soar, And life's greatest joys can be found and more.
```
