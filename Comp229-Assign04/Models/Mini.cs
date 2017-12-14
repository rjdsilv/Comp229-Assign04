using Newtonsoft.Json;
using System.Collections.Generic;

namespace Comp229_Assign04.Models
{
    /// <summary>
    /// Class representing the JSON model to be used.
    /// </summary>
    public class Mini
    {
        public static char[] SEPARATOR = new char[] { ',' };

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("faction")]
        public string Faction { get; set; }

        [JsonProperty("rank")]
        public uint Rank { get; set; }

        [JsonProperty("base")]
        public uint Base { get; set; }

        [JsonProperty("size")]
        public uint Size { get; set; }

        [JsonProperty("deploymentZone")]
        public string DeploymentZone { get; set; }

        [JsonProperty("traits")]
        public List<string> Traits { get; set; }

        [JsonProperty("types")]
        public List<string> Types { get; set; }

        [JsonProperty("defenseChart")]
        public List<string> DefenseChart { get; set; }

        [JsonProperty("mobility")]
        public uint Mobility { get; set; }

        [JsonProperty("willpower")]
        public uint Willpower { get; set; }

        [JsonProperty("resiliance")]
        public uint Resiliance { get; set; }

        [JsonProperty("wounds")]
        public uint Wounds { get; set; }

        [JsonProperty("actions")]
        public List<Action> Actions { get; set; }

        [JsonProperty("specialAbilities")]
        public List<SpecialAbility> SpecialAbilities { get; set; }

        [JsonProperty("imageUrl")]
        public string ImageUrl { get; set; }
    }

    /// <summary>
    /// Class representing an action on the JSON model.
    /// </summary>
    public class Action
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("type")]
        public string Type { get; set; }

        [JsonProperty("rating")]
        public uint Rating { get; set; }

        [JsonProperty("range")]
        public string Range { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }
    }

    /// <summary>
    /// Class representing a special ability on the JSON model.
    /// </summary>
    public class SpecialAbility
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }
    }
}